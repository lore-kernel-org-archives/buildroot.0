From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 4 Dec 2016 22:20:25 +0100
Subject: [Buildroot] [PATCH 2/3] core: waf-package infra: add missing
 additional variables for each build step
In-Reply-To: <20161204220409.45688c5a@free-electrons.com>
References: <1480885126-517-1-git-send-email-romain.naour@gmail.com>
 <1480885126-517-2-git-send-email-romain.naour@gmail.com>
 <20161204220409.45688c5a@free-electrons.com>
Message-ID: <986ec82d-e29b-0a1f-c894-f82415cc6d53@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 04/12/2016 ? 22:04, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sun,  4 Dec 2016 21:58:45 +0100, Romain Naour wrote:
>> Some waf packages may want to pass additional variables to waf script
>> in each build step. Add the possibility to do so by defining the
>> following variables:
>>   <pkg>_MAKE_OPTS for the build step
>>   <pkg>_INSTALL_STAGING_OPTS for the install to staging directory
>>   <pkg>_INSTALL_TARGET_OPTS for the install to target directory
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Isn't it a bug of the upstream package that we need to pass --no-tests
> at every step?

humm, maybe...
At first, I used --no-tests with AUBIO_CONF_OPTS but it's not enough.
All other options are saved in aubio-0.4.3/build/c4che/_cache.py
but not this one.

> 
> Other than that, this change lacks the corresponding update to the
> Buildroot manual.

Right, I'll update the manual after Yann's comment on this patch (if accepted).

Best regards,
Romain

> 
> Thomas
> 
