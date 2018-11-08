From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Nov 2018 22:24:44 +0100
Subject: [Buildroot] [PATCH 1/1] twolame: fix static linking with
 libmagic
In-Reply-To: <20181108201532.23479-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 8 Nov 2018 21:15:32 +0100")
References: <20181108201532.23479-1-fontaine.fabrice@gmail.com>
Message-ID: <87k1ln8dpf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libmagic (from file package) already provides the buffer_init function
 > so to avoid a build failure for applications wanting to statically link
 > with twolame and libmagic (for example sox), rename buffer_init into
 > bitbuffer_init (also rename buffer_deinit into bitbuffer_deinit and
 > buffer_sstell into bitbuffer_sstell for consistency)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b3fc62e7f372fe595966e84091c11ccdb4cfa77c

Grr, libraries should use unique prefixes for public symbols.

A conflict can still happen with bitbuffer_, but OK - It is less likely
to happen.

Committed, thanks.

-- 
Bye, Peter Korsgaard
