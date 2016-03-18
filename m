From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Mar 2016 22:14:21 +0100
Subject: [Buildroot] [PATCH] pkgconf: Add a symlink to the
 GNU_TARGET_NAME-pkg-config
In-Reply-To: <20160318172447.GA3696@free.fr>
References: <1456770170-6326-1-git-send-email-jer@airfi.aero>
 <u7ieqcx9kv.ln2@ID-313208.user.individual.net>
 <20160229213520.2b6e6ee7@free-electrons.com> <56D605CD.1070008@mind.be>
 <20160318172447.GA3696@free.fr>
Message-ID: <56EC6FAD.9090000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/16 18:24, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2016-03-01 22:12 +0100, Arnout Vandecappelle spake thusly:
>> On 02/29/16 21:35, Thomas Petazzoni wrote:
>> [snip]
>>> What I dislike with the current setup is that if you add
>>> $(HOST_DIR)/usr/bin to your PATH, then any call to pkg-config returns
>>> values that are valid only when cross-compiling, which is not
>>> necessarily what one would expect.
>>
>>   For exactly this reason I would like to introduce a config-script directory,
>> e.g. $(HOST_DIR)/usr/cross-bin. In this directory we would put the
>> cross-pkg-config and the fixed up config scripts we now search for in
>> $(STAGING_DIR)/usr/bin.
>
> Like this:
>      https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/foo-config-in-PATH
>
> Last I sent this series, Thomas was not fond of it, IIRC...

  I re-read the thread and couldn't find a real argument from Thomas :-)

>
>      http://lists.busybox.net/pipermail/buildroot/2015-December/thread.html#147891
>      http://lists.busybox.net/pipermail/buildroot/2015-December/147927.html
>      and ensuing mails...
>
> BTW, you were in Cc for that series. ;-)

  Yes, it is still in my list of 500 mails marked "I really should reply to 
this, but it's going to take a bit of time so let's first do the easy stuff". 
Thomas DS can explain you all about that :-P

  Regards,
  Arnout


>
> Regards,
> Yann E. MORIN.
>
>>   Regards,
>>   Arnout
>>
>>>
>>> However, doing this change means that any configure script or Makefile
>>> that calls pkg-config directly would no longer find our pkg-config.
>>>
>>> Best regards,
>>>
>>> Thomas
>>>
>>
>>
>> --
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
