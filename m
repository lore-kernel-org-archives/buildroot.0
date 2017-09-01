From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Sep 2017 01:18:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix gtk support
In-Reply-To: <5fe9c108-7a04-ca7c-9bd8-aed7ac639026@mind.be> (Arnout
 Vandecappelle's message of "Wed, 12 Jul 2017 12:04:42 +0200")
References: <20170710175137.1402-1-bernd.kuhls@t-online.de>
 <87a84asr2s.fsf@dell.be.48ers.dk>
 <20170711231701.3850d479@windsurf.lan>
 <a69e0db5-ae3c-fa51-7864-8fd8c98dd71c@mind.be>
 <20170712094924.435a5c54@windsurf.lan>
 <5fe9c108-7a04-ca7c-9bd8-aed7ac639026@mind.be>
Message-ID: <873786qa77.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Why should we randomly pass --enable-nls to some packages? Why should
 >> this package depends on BR2_SYSTEM_ENABLE_NLS, if it needs NLS support?

 >  Because BR2_SYSTEM_ENABLE_NLS does not really say that NLS *support* is
 > enabled, it says that NLS *installation* is enabled. NLS support is always
 > "enabled" through the stubs in musl/uClibc.

 >  As far as I understand, the configure error is just there because the
 > transmission guys are too lazy to have conditional use of the intl functions. I
 > don't see how there could be a hard requirement on non-stub implementations of
 > the intl functions - except if they start calling internals. So the better
 > solution, actually, would be to patch out this check in configure and instead
 > check for intl and error out if that is not available, independent on the
 > --enable-nls option - just like most packages do, I think.

 >  If you're not actually interested in translations, there is no reason really
 > why you should pull them in just because this package is calling gettext stuff
 > unconditionally.

 >  That said, probably nobody really cares, we're just fixing build failures here.
 > So in the end I don't really mind if we depend on BR2_SYSTEM_ENABLE_NLS as the
 > easy way out. Though then the commit message should at least provide the full
 > story, as a hint for future contributors who want to fix it properly.

Correct. I went with depending on BR2_SYSTEM_ENABLE_NLS, but I added a
comment explaining that we could also explictly pass --enable-nls.

-- 
Bye, Peter Korsgaard
