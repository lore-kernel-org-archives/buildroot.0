From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 09:56:20 +0100
Subject: [Buildroot] [PATCH] docs/manual: standardize a bit more the
 formatting of commit titles
In-Reply-To: <87lg5h5ym2.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 25 Nov 2018 09:51:17 +0100")
References: <20181124101903.18138-1-thomas.petazzoni@bootlin.com>
 <1442786873.3545705.1543108593942.JavaMail.zimbra@datacom.com.br>
 <87lg5h5ym2.fsf@dell.be.48ers.dk>
Message-ID: <87h8g55ydn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Carlos" == Carlos Santos <casantos@datacom.com.br> writes:
 > Hi,

 >>> First of all, it is essential that the patch has a good commit
 >>> message. The commit message should start with a separate line with a
 >>> -brief summary of the change, starting with the name of the affected
 >>> -package. The body of the commit message should describe _why_ this
 >>> +brief summary of the change, prefixed by the area touched by the
 >>> +patch. A few examples of good commit titles:
 >>> +
 >>> +* +package/linuxptp: bump version to 2.0+

 >> Looks good, but isn't "package/" a bit superfluous, since Most of the
 >> commits are for packages? It also goes against the tradition:

 >> $ git log --oneline origin/master | grep -i '^.......... [^ /]*: bump' |wc -l
 >> 7644
 >> $ git log --oneline origin/master | grep -i '^.......... [^ ]*/[^ ]*: bump' |wc -l
 >> 2296

 > I also personally prefer without package/, but consistency and
 > documentation in the manual is nice, so Ok for me.

Next to the purely subjective preference, there is also the issue of
running into the max subject length with long package paths, E.G.:

package/freescale-imx/kernel-module-imx-gpu-viv: <blah>
package/x11r7/xfont_font-bh-lucidatypewriter-100dpi: <blih>
package/python-backports-shutil-get-terminal-size: <bloh>

-- 
Bye, Peter Korsgaard
