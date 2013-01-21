From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 18:48:53 +0100
Subject: [Buildroot] [PATCH] iftop: new package
In-Reply-To: <1358796288-17403-1-git-send-email-bogdan@nimblex.net>
References: <87622rd1ex.fsf@dell.be.48ers.dk>
 <1358796288-17403-1-git-send-email-bogdan@nimblex.net>
Message-ID: <20130121184853.0174d33d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bogdan Radulescu,

On Mon, 21 Jan 2013 19:24:48 +0000, Bogdan Radulescu wrote:
> I adjusted my patch and yes, the correct way is very nice :)
> I was at the mountains and I didn't have my computer to send the
> adjustment earlier. Thanks for you advice!

You shouldn't put such a message here in the commit log: it will be
preserved forever in the Git history. If you want to send such
informations, either use an introduction e-mail (separate from the
e-mail carrying the patch itself), or for a single patch, put your
"personal" comments...

> 
> 
> Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
> ---

... here. I.e, after the --- line.


> +config BR2_PACKAGE_IFTOP
> +	bool "iftop"
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_LIBPCAP
> +	select BR2_INET_IPV6

No. Please look at how other packages do it for BR2_INET_IPV6. You're
not allowed to select it. You should depend on it, and show a comment
when BR2_INET_IPV6 is not available.

> +
> +	help

No empty line between the bool/select/depends on line and the help line.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
