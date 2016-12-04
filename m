From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 4 Dec 2016 22:44:16 +0100
Subject: [Buildroot] [PATCH 2/3] core: waf-package infra: add missing
 additional variables for each build step
In-Reply-To: <20161204222243.7431c24c@free-electrons.com>
References: <1480885126-517-1-git-send-email-romain.naour@gmail.com>
 <1480885126-517-2-git-send-email-romain.naour@gmail.com>
 <20161204220409.45688c5a@free-electrons.com>
 <986ec82d-e29b-0a1f-c894-f82415cc6d53@gmail.com>
 <20161204222243.7431c24c@free-electrons.com>
Message-ID: <6ba5ccc4-1fdf-41fe-6fcb-0b8d0ec0978c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 04/12/2016 ? 22:22, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sun, 4 Dec 2016 22:20:25 +0100, Romain Naour wrote:
> 
>>> Isn't it a bug of the upstream package that we need to pass --no-tests
>>> at every step?  
>>
>> humm, maybe...
>> At first, I used --no-tests with AUBIO_CONF_OPTS but it's not enough.
>> All other options are saved in aubio-0.4.3/build/c4che/_cache.py
>> but not this one.
> 
> It would be good to understand why.

--notests doesn't seems to be an waf option but an option used in
waflib/Tools/waf_unit_test.py. That's why it's not cached.

I'll report this issue upstream.

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
