From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 14:53:41 +0100
Subject: [Buildroot] [PATCH v2 10/15] reproducible: enable fakedate
In-Reply-To: <20161118124933.68b64d53@free-electrons.com>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-11-git-send-email-jezz@sysmic.org>
 <20161118124933.68b64d53@free-electrons.com>
Message-ID: <9c26bf8aba6470357f9d5b178261e583@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-11-18 12:49, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 18 Nov 2016 10:10:19 +0100, J?r?me Pouiller wrote:
> 
>> +ifeq ($(BR2_REPRODUCIBLE),y)
>> +TOOLCHAIN_DEPENDENCIES += host-fakedate
>> +endif
> 
> Unfortunately, this means that fakedate is only installed at the end of
> the toolchain build process. So the entire toolchain is built without
> fakedate installed.
> 
> Is it because we assume that the toolchain build process is safe (i.e
> it doesn't call "date") ?

During my tests, fakedate was build before host-gcc-initial. Indeed, I
was lucky (in add, I think toolchain build process is safe).


> Perhaps it should be added in DEPENDENCIES_HOST_PREREQ instead ?

Right.

-- 
J?r?me Pouiller
