From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 8 Mar 2012 18:29:47 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh: use series file to apply
 patches in proper order
In-Reply-To: <1331233872-31746-1-git-send-email-ludovic.desroches@atmel.com>
References: <CAHXCMMLOGDZ5g30OM+5dryn-5kAgtLeeB4R8UAYBfHW4VUC=MQ@mail.gmail.com>
 <1331233872-31746-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <CAHXCMMLWPp81PcHR17pEwEaPoWHLa5PnLZcTu=Lt7uCASXMEiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ludovic,

> + ? ?# If there is a series file, use it instead of using ls sort order
> + ? ?# to apply patches. Skip line starting with a dash.
> + ? ?if [ -e "${path}/series" ] ; then
> + ? ? ? ?for i in `cat ${path}/series | grep -Ev "^#" 2> /dev/null` ; do
Or simply:
for i in `grep -Ev "^#" ${path}/series 2> /dev/null` ; do


Regards,

Sam
