From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Nov 2017 22:05:25 +0100
Subject: [Buildroot] [PATCH] dropbear: change start-up script to honour
 pre-existing keys
In-Reply-To: <20171115194509.78132-1-code@mmayer.net> (Markus Mayer's message
 of "Wed, 15 Nov 2017 11:45:09 -0800")
References: <20171115194509.78132-1-code@mmayer.net>
Message-ID: <874lpv9rsa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Mayer <code@mmayer.net> writes:

 > From: Markus Mayer <mmayer@broadcom.com>
 > Rather than starting dropbear with option -R at all times, we only do
 > so if no existing key file is found. This lets dropbear honour
 > pre-existing key files, including keys copied into the root file system
 > at build time.

But -R already only generates keys if needed?

See svr-kex.c::svr_ensure_hostkey()

Why is that not working for you?

-- 
Bye, Peter Korsgaard
