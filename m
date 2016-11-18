From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 14:44:50 +0100
Subject: [Buildroot] [PATCH v2 04/15] fs/tar: make results reproducible
In-Reply-To: <20161118142945.60adccd8@free-electrons.com>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-5-git-send-email-jezz@sysmic.org>
 <20161118124008.2b7a3178@free-electrons.com>
 <28c618b1c91a0df16af32645666e7198@sysmic.org>
 <20161118142945.60adccd8@free-electrons.com>
Message-ID: <b762049e2698fa9e52f43abd5571d6a2@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-11-18 14:29, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 18 Nov 2016 14:02:58 +0100, J?r?me Pouiller wrote:
> 
>> My workstation only have tar 1.27 installed. When tar version is 
>> wrong,
>> compilation does not fail. Instead, host-tar is compiled before any
>> other packages (see support/dependencies/check-host-tar.mk)
> 
> Yes, I know, but it's a pain to force everyone using an old distro to
> build host-tar. Maybe we should make this conditional on
> BR2_REPRODUCIBLE?

Last Ubuntu LTS is 16.04 and Debian 9 will be stable in a few months 
(maybe
simultaneous with next Buildroot version).

So, IMHO it not justified to add a dirty condition in check-host-tar.sh.

--
J?r?me Pouiller
