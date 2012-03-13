From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Tue, 13 Mar 2012 22:23:37 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh: use series file to apply
 patches in proper order
In-Reply-To: <4F5F4624.1000607@free.fr>
References: <CAHXCMMLOGDZ5g30OM+5dryn-5kAgtLeeB4R8UAYBfHW4VUC=MQ@mail.gmail.com>
 <1331233872-31746-1-git-send-email-ludovic.desroches@atmel.com>
 <CAHXCMMLWPp81PcHR17pEwEaPoWHLa5PnLZcTu=Lt7uCASXMEiw@mail.gmail.com>
 <20120312085752.GB444@game.jcrosoft.org> <4F5F4624.1000607@free.fr>
Message-ID: <20120313212337.GE2725@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 13, 2012 at 02:05:40PM +0100, Julien Boibessot wrote:
> On 03/12/2012 09:57 AM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> >On 18:29 Thu 08 Mar     , Samuel Martin wrote:
> >>Hi Ludovic,
> >>
> >>>+    # If there is a series file, use it instead of using ls sort order
> >>>+    # to apply patches. Skip line starting with a dash.
> >>>+    if [ -e "${path}/series" ] ; then
> >>>+        for i in `cat ${path}/series | grep -Ev "^#" 2>  /dev/null` ; do
> >>Or simply:
> >>for i in `grep -Ev "^#" ${path}/series 2>  /dev/null` ; do
> >why not simply use quilt?
> >

I have just followed Arnout comments since they have already discussed about
this topic.

> >it will simply also patch series upgrade
> >
> >we just have to add quilt to the host tools
> 
> +1
> 

Why not.

I have never used quilt so I have read the man page and I don't see how
it could make our life easier to simply apply patches.

From what I have seen (the man page and a small tutorial), it is requiring
a series file so I don't see how it can be useful to apply a patch serie
without this series file.

As I said, I have never used quilt so I'm probably wrong. Maybe I have missed
some useful and powerful commands. Please let me know how it can feet our needs.


Regards

Ludovic
