From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 16:46:53 +0100
Subject: [Buildroot] [PATCH] script/scancpan: add -host & -hostonly
 options
In-Reply-To: <1396106224-26505-1-git-send-email-francois.perrad@gadz.org>
References: <1396106224-26505-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140329164653.2ce9f6a3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat, 29 Mar 2014 16:17:04 +0100, Francois Perrad wrote:

> +=item B<-host>
> +
> +Generates package for the target and host variants (the default is for target only).
> +
> +=item B<-hostonly>
> +
> +Generates package only for the host variant (the default is for target only).

The naming of the options look really weird, IMO. If you use -host, I
would assume that only the host variant is generated. What about:

 * default behavior: target only (i.e same as -target below)
 * -target: enable target package
 * -notarget: disable target package
 * -host: enable host package
 * -nohost: disable host package

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
