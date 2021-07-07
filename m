From: Herve Codina <herve.codina@bootlin.com>
Date: Wed, 7 Jul 2021 14:07:08 +0200
Subject: [Buildroot] [PATCH v2 17/18] support/testing/tests: add test
 for check_bin_arch
In-Reply-To: <20210706212518.GS2521@scaer>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-18-herve.codina@bootlin.com>
 <20210706202001.GP2521@scaer> <20210706212518.GS2521@scaer>
Message-ID: <20210707140708.259208a1@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 6 Jul 2021 23:25:18 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > So, this tests explicitly installs a host executable in target/, yet the
> > assert is written to ensure there is no error: it compares against zero.
> > So this test-case will fail, by design.  
> 
> Ah, I think I see the issue: previously, the test by Thomas was calling
> 'grep', and was checking against '0', which meant that grep _had found_
> the string...
> 
> So yeah, we really need to check that we _did_ find the error pattern:
>     self.assertEqual(len(lines), 1)
> 

Oups,

I was focused on overwrite detection and I missed this one.
I am sorry.

I confirm, 'self.assertEqual(len(lines), 1)' fixed the test.

Herv?

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
