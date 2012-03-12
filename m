From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Mon, 12 Mar 2012 09:57:52 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh: use series file to apply
 patches in proper order
In-Reply-To: <CAHXCMMLWPp81PcHR17pEwEaPoWHLa5PnLZcTu=Lt7uCASXMEiw@mail.gmail.com>
References: <CAHXCMMLOGDZ5g30OM+5dryn-5kAgtLeeB4R8UAYBfHW4VUC=MQ@mail.gmail.com>
 <1331233872-31746-1-git-send-email-ludovic.desroches@atmel.com>
 <CAHXCMMLWPp81PcHR17pEwEaPoWHLa5PnLZcTu=Lt7uCASXMEiw@mail.gmail.com>
Message-ID: <20120312085752.GB444@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18:29 Thu 08 Mar     , Samuel Martin wrote:
> Hi Ludovic,
> 
> > + ? ?# If there is a series file, use it instead of using ls sort order
> > + ? ?# to apply patches. Skip line starting with a dash.
> > + ? ?if [ -e "${path}/series" ] ; then
> > + ? ? ? ?for i in `cat ${path}/series | grep -Ev "^#" 2> /dev/null` ; do
> Or simply:
> for i in `grep -Ev "^#" ${path}/series 2> /dev/null` ; do
why not simply use quilt?

it will simply also patch series upgrade

we just have to add quilt to the host tools

Best regards,
J.
