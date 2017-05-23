From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 23 May 2017 23:09:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/sngrep: add libgcrypt missing
 dependencies
In-Reply-To: <20170523161950.2b24f43f@free-electrons.com>
References: <20170520162751.30809-1-romain.naour@gmail.com>
 <20170523161950.2b24f43f@free-electrons.com>
Message-ID: <f09dc6c1-557c-885b-4bb9-370a1ca9b8ae@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 23/05/2017 ? 16:19, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sat, 20 May 2017 18:27:50 +0200, Romain Naour wrote:
>> Even if libgcrypt is selected at Kconfig level, it's missing from
>> Makefile level.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/36c/36c28e7e49b31ed2398a67db2e9b08e3aad5a3ee
> 
> Could you explain how this build failure apparently related to ncurses
> has something to do with the gnutls/libgcrypt issue ?
> 
> The patch itself looks good, but the relation with this particular
> build failure isn't really clear. Could you clarify?

Sorry,

I was looking for this kind of build failure with a glibc based system:

checking for ncurses.h... yes
checking for initscr in -lncurses... yes
checking for new_panel in -lpanel... yes
checking for new_form in -lform... yes
checking for new_item in -lmenu... yes
checking for gnutls_init in -lgnutls... yes
checking for gcry_md_map_name in -lgcrypt... no
configure: error:  You need to have libgcrypt installed to compile sngrep

I just read what I wanted to read in the autobuilder reference...

It's weird that the autobuilder didn't catch it.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
