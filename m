From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 08 May 2020 12:06:49 +0200
Subject: [Buildroot] [PATCH v2,
 2/3] package/libarchive: add lz4 optional dependency
In-Reply-To: <20200425215616.734f817a@windsurf.home> (Thomas Petazzoni's
 message of "Sat, 25 Apr 2020 21:56:16 +0200")
References: <20200228221236.1982482-1-fontaine.fabrice@gmail.com>
 <20200228221236.1982482-2-fontaine.fabrice@gmail.com>
 <20200425215616.734f817a@windsurf.home>
Message-ID: <877dxmrb9i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Fri, 28 Feb 2020 23:12:35 +0100
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> lz4 is available since version 3.2.0 and
 >> https://github.com/libarchive/libarchive/commit/724f3f918e509ddca60ce62fad696d7621d3623d
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/libarchive/libarchive.mk | 7 +++++++
 >> 1 file changed, 7 insertions(+)
 >> 
 >> diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
 >> index b7ae5fb0cf..d07f0776a6 100644
 >> --- a/package/libarchive/libarchive.mk
 >> +++ b/package/libarchive/libarchive.mk
 >> @@ -78,6 +78,12 @@ else
 >> LIBARCHIVE_CONF_OPTS += --without-xml2
 >> endif
 >> 
 >> +ifeq ($(BR2_PACKAGE_LZ4),y)
 >> +LIBARCHIVE_DEPENDENCIES += lz4

 > I've added an explicit --with-lz4 here and applied. Thanks!

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
