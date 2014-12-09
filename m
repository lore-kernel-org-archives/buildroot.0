From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 10:02:58 +0100
Subject: [Buildroot] [PATCH v5 1/1] set simple network setup via the
 system configuration submenu
In-Reply-To: <1418114924-18826-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1418114924-18826-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20141209100258.79254fea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

On Tue,  9 Dec 2014 09:48:44 +0100, J?r?my Rosen wrote:

> +check_configuration ()
> +{
> +	if [ -z "$BR2_SIMPLE_NETWORK_NONE" ] ; then

Can we try to avoid unnecessary indentation, and so things the other
way around, i.e if BR2_SIMPLE_NETWORK_NONE is not empty, bail out from
the function?

	if [ -n "$BR2_SIMPLE_NETWORK_NONE" ] ; then
		return
	fi

> +		if [ -z "$BR2_SIMPLE_NETWORK_NAME" ] ; then
> +			echo ERROR no name specified for first network interface
> +			exit 1
> +		fi
> +		if [ "$BR2_SIMPLE_NETWORK_IPV4_MANUAL" ] ; then

No condition?

> +	if [ -z "$BR2_SIMPLE_NETWORK_NONE" ] ; then

Same comment here.

> +		echo "auto $BR2_SIMPLE_NETWORK_NAME"
> +		if [ "$BR2_SIMPLE_NETWORK_IPV4_DHCP" ] ; then

And here.

That being said, generally, I find this quite complicated, and my
preference would be to continue with what we have today, and simply let
the user override things with a root filesystem overlay or a post-build
script.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
