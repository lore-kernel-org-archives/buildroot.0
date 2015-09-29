From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 29 Sep 2015 19:13:59 +0100
Subject: [Buildroot] [PATCH] glmark2: depend on host-python
In-Reply-To: <20150928225214.33f8785d@free-electrons.com>
References: <1443194731-52284-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150927212127.2e70faeb@free-electrons.com> <5608FB43.9060408@imgtec.com>
 <20150928225214.33f8785d@free-electrons.com>
Message-ID: <560AD4E7.1090208@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 28/09/15 21:52, Thomas Petazzoni wrote:
> Vicente,
>
> On Mon, 28 Sep 2015 09:33:07 +0100, Vicente Olivert Riera wrote:
>
>>>  From a quick look, I don't see anything in the glmark2 source code that
>>> would need Python. It's really only waf itself that uses Python. So I
>>> don't quite see where PYTHON_CONFIG can actually be useful...
>>
>> Exactly. In fact, I managed to build the package when the value was
>> $(STAGING_DIR)/usr/bin/python-config which didn't exist.
>>
>> Should we remove it?
>
> I don't know. It is there since when the package was originally
> introduced by Spenser, so I have no idea why those three PYTHON_*
> variables were added.
>
> If the build works for you without those variables, then I would
> suggest to remove them, and see what the autobuilders say.


I remember that I already tried to remove them and it built fine, but 
anyway I have double checked it just in case, and yes, I confirm that it 
builds fine.

> What do you think?

Yeah, remove them and see if there is any autobuilder issue. I have sent 
an v2.

Regards,

Vincent.

> Thomas
>
