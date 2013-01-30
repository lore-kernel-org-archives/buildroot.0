From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jan 2013 15:34:41 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <20130130142442.3803d2bc@skate>
References: <cover.1359498504.git.yann.morin.1998@free.fr>
 <201301301413.13408.yann.morin.1998@free.fr> <20130130142442.3803d2bc@skate>
Message-ID: <201301301534.41339.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 30 January 2013 14:24:42 Thomas Petazzoni wrote:
> On Wed, 30 Jan 2013 14:13:13 +0100, Yann E. MORIN wrote:
> > And the generic infrastructure does not allow to extract an archive to
> > get patches from.
[--SNIP--]
> We have several packages on which we apply the Debian patches. At least
> argus and cvs comes to mind.
> 
> Basically, what we do is:
> 
> ARGUS_PATCH = argus_$(ARGUS_VERSION)-1.diff.gz
[--SNIP--]
> To actually apply those patches.

Indeed, that was informational. Thanks! :-)

Unfortunately, for pmake, the Debian "patch" does not come as a patch,
but as a tarball to be extracted in the pmake source dir. So, using:

    PMAKE_DEB_VER = -3.2-debian
    PMAKE_PATCH   = pmake_$(PMAKE_VERSION)$(PMAKE_DEB_VER).tar.gz

will not work, as this is not a patch. :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
