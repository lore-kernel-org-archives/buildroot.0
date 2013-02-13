From: Patrick <kpa_info@yahoo.fr>
Date: Wed, 13 Feb 2013 11:07:18 +0100
Subject: [Buildroot] [PATCH v3 2/5] Add python3 config directory simlink
In-Reply-To: <20130213103319.678c7948@skate>
References: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
 <1360747237-30048-3-git-send-email-kpa_info@yahoo.fr>
 <20130213103319.678c7948@skate>
Message-ID: <511B65D6.9070003@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/13/2013 10:33 AM, Thomas Petazzoni wrote:
> Dear Patrick Gerber,
>
> On Wed, 13 Feb 2013 10:20:34 +0100, Patrick Gerber wrote:
>> Add a simlink to alias the python3.3/config-3.3m directory to python3.3/config
>> in the staging directory
>
> This description doesn't match what the code is doing. The code creates
> a symbolic link in $(HOST_DIR), not $(STAGING_DIR).
>
> Also, this commit log doesn't explain *why* this is needed in the first
> place. The commit log only explains what the patch is doing (which we
> can easily find out by reading the code), but lacks an explanation of
> the underlying reasons.
>
> Thanks,
>
> Thomas
>

When using host python to install an external module, the setup tools 
look for a python3.3/config/pyconfig.h file. With the python3 package 
from buildroot this directory is called config-3.3m. This is why we need 
to alias config to config-3.3m.

Patrick
