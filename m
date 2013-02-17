From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Feb 2013 23:02:48 +0100
Subject: [Buildroot] [PATCH] libcurl: re-enable on non-MMU platforms
In-Reply-To: <1360849818-30031-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 14 Feb 2013 14:50:18 +0100")
References: <20130214144713.632dcc63@skate>
 <1360849818-30031-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ip5qmwdz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In 9229b82d6326ea425a258b91a9f0157ef6b223b7 ('libcurl: needs MMU'),
 Thomas> the libcurl package was disabled on non-MMU systems, due to the usage
 Thomas> of the fork() function in the library.

 Thomas> However, a deeper inspection reveals that fork() is only used in the
 Thomas> implementation of NTLM, an obscure, undocumented, Microsoft specific
 Thomas> authentication method that apparently isn't common anymore. See
 Thomas> http://curl.haxx.se/docs/manpage.html#--ntlm.

Yeah, tell me about it - I know of a certain company using it :/

Committed, thanks.

-- 
Bye, Peter Korsgaard
