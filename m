From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 20 Apr 2020 14:19:55 +0200
Subject: [Buildroot] [PATCH 1/2] support/scripts: add check-dotconfig.py
In-Reply-To: <20200420135200.0331bfc0@windsurf.home>
References: <20200420091757.2931721-1-romain.naour@gmail.com>
 <20200420135200.0331bfc0@windsurf.home>
Message-ID: <ec5face2-dba6-695a-81f4-1b4948261720@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 20/04/2020 ? 13:52, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Mon, 20 Apr 2020 11:17:56 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> For the same reason as for 50b747f212be2c9c0f7cf10c674ed488d042715c,
>> we need to check if the generated configuration file (.config)
>> contains all symbols present in the defconfig file.
> 
> Then can we also make the runtime-test infrastructure use this
> check-dotconfig.py script ?

Not with the current implementation of the runtime-test infrastructure since the
defconfig is bundled in the test python script.

The defconfig is written to .config but then we run make olddefconfig to
generate the real .config. So we can't compare the .config file with
check-dotconfig.py without creating a defconfig file.

> 
> No need to do it right now, in this patch or patch series, but just
> something that would be good to have.

This can be easily be done in a followup patch.

Best regards,
Romain

> 
> Thanks!
> 
> Thomas
> 
