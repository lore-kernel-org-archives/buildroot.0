From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Apr 2010 09:21:23 +0200
Subject: [Buildroot] uclibc and gcc tls
In-Reply-To: <81E98B2D-4CAA-4230-80C3-4F78CF7C5F76@me.com> (Thomas
	Brandstetter's message of "Sat, 27 Mar 2010 21:12:39 +0100")
References: <81E98B2D-4CAA-4230-80C3-4F78CF7C5F76@me.com>
Message-ID: <87hbnnramk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Brandstetter <thomas.brandstetter@me.com> writes:

 Thomas> Hi,
 Thomas> I'm building Buildroot with Uclibc and gcc 4.4.3. Actually, I got an error during the pcre build:

 Thomas> i686-linux-uclibc/lib/libstdc++.so: undefined reference to `___tls_get_addr'

 Thomas> I searched for uclibc problems and found out that uclibc doesn't support tls. Can you please integrate a check which disables the BR2_GCC_ENABLE_TLS option for uclibc building toolchains?

Hmm, we already have a 'depends on !BR2_GCC_VERSION_4_4_X', so you
shouldn't be able to enable this with gcc 4.4.x - Could you please post
your .config?

-- 
Bye, Peter Korsgaard
