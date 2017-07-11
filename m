From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 23:57:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix gtk support
In-Reply-To: <a69e0db5-ae3c-fa51-7864-8fd8c98dd71c@mind.be> (Arnout
 Vandecappelle's message of "Tue, 11 Jul 2017 23:42:24 +0200")
References: <20170710175137.1402-1-bernd.kuhls@t-online.de>
 <87a84asr2s.fsf@dell.be.48ers.dk>
 <20170711231701.3850d479@windsurf.lan>
 <a69e0db5-ae3c-fa51-7864-8fd8c98dd71c@mind.be>
Message-ID: <87zicaprft.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> So I am not sure the fix is complete. Indeed the error says that the
 >> gtk client cannot be built without nls support. So I guess that if you
 >> have BR2_PACKCAGE_TRANSMISSION_GTK=y, but BR2_SYSTEM_ENABLE_NLS
 >> disabled it still fails to build.

 >  But only because we pass --disable-nls. I expect that passing --enable-nls
 > should be sufficient to fix the build again. Indeed, all libcs not have libintl
 > stubs built in so there is no reason why it shouldn't just work when you pass
 > --enable-nls.

Yes, makes sense with the latest changes. Care to give it a try / send a
patch?

-- 
Bye, Peter Korsgaard
