From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 14 Feb 2015 12:38:45 +0100
Subject: [Buildroot] [PATCH 3/3] package/openmvtools: don't use host
 library path
In-Reply-To: <20150214092334.6b8cc55c@free-electrons.com>
References: <1423437730-22997-1-git-send-email-romain.naour@openwide.fr>	<1423437730-22997-3-git-send-email-romain.naour@openwide.fr>
 <20150214092334.6b8cc55c@free-electrons.com>
Message-ID: <54DF33C5.1010900@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 14/02/2015 09:23, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Mon,  9 Feb 2015 00:22:10 +0100, Romain Naour wrote:
> 
>> +OPENVMTOOLS_CONF_ENV += CUSTOM_PROCPS_NAME=procps \
>> +	CUSTOM_PROCPS_LIBS="-L$(STAGING_DIR)"
> 
> Have you tried:
> 
> 	CUSTOM_PROCPS_LIBS=" "
> 
>  ?
> 
> We're already using this trick in the openvmtools package for the
> libdnet detection.
> 

My intention was to help the configure script to find libprocps.so in
STAGING_DIR/lib. I forgot to add the "/lib"...

But, you're right.
Using CUSTOM_PROCPS_LIBS=" " is enough.

I'll respin shortly.

Best regards,
Romain

> Thomas
> 
