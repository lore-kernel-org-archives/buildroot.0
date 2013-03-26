From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Mar 2013 08:25:11 +0100
Subject: [Buildroot] [PATCH v3 2/2] buildroot: target: Add Blackfin
 architecture support.
In-Reply-To: <1363942902-6045-2-git-send-email-sonic.adi@gmail.com>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
 <1363942902-6045-2-git-send-email-sonic.adi@gmail.com>
Message-ID: <51514D57.1090907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/03/13 10:01, Sonic Zhang wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
[snip]

  Hi Sonic,

  Looks like you again choose a difficult patch set to try to upstream...

  After reading all the comments in this thread, I propose to split up 
the patch set as follows in order to get some progress on it.

1. Add blackfin CPU choice.
This patch adds a Target CPU configuration option and uses it to select a 
-m option for gcc.

2. Introduce target CPU revision.
Adds the possibility (in the general infrastructure, not 
blackfin-specific) to have a free-form CPU revision string and append it 
to the target CPU. Only Blackfin actually uses this option.

3. Introduce BINFMT_FLAT.
Just introduce the symbol and add options in blackfin to select it.

4. Introduce package-specific BINFMT_FLAT options.
I.e. <PKG>_FLAT_STACKSIZE

5. Introduce blackfin-specific Makefile
Probably needs more work.

6. Introduce NOMMU symbol
Probably needs more work.



  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
