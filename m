From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Sat, 29 Aug 2015 15:52:27 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: stat.h is need for mode_t
In-Reply-To: <20150828193146.58c943bc@free-electrons.com>
References: <1440773264-14999-1-git-send-email-gwenj@trabucayre.com>
 <20150828193146.58c943bc@free-electrons.com>
Message-ID: <20150829155227.54561ee9@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni
On Fri, 28 Aug 2015 19:31:46 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Gwenhael Goavec-Merou,
> 
> On Fri, 28 Aug 2015 16:47:44 +0200, Gwenhael Goavec-Merou wrote:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > fix :
> > http://autobuild.buildroot.net/results/8e3/8e3afd5f22312f0660f631fdb82bbb64eda913fb/build-end.log
> > 
> > error: 'mode_t' has not been declared
> > 
> > Signed-off-by: Gwenhael Goavec-Merou
> > <gwenhael.goavec-merou@trabucayre.com>
> 
> mode_t is according to the standard
> (http://pubs.opengroup.org/onlinepubs/007908799/xsh/sysstat.h.html)
> defined in <sys/types.h>. Can you try including <sys/types.h> instead?
> 
Ok It's working with sys/types.h
> If that works as well, then please submit the patch upstream: it is
> valid for all toolchains.
> 
I've checked all the autobuild for 07/2015 and 08/2015. The missing
mode_t only appears if the toolchain is based on musl. I'll will,
nevertheless, try to send my patch to gnuradio.

Gwenhael
