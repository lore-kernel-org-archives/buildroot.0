From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 4 Jan 2018 15:42:36 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-01-03
In-Reply-To: <20180104070035.EEAA2207B1@mail.free-electrons.com>
References: <20180104070035.EEAA2207B1@mail.free-electrons.com>
Message-ID: <12466b9b-4377-b65c-bdb7-c76b136fc3ef@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 04/01/2018 ? 08:00, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Build statistics for 2018-01-03
> ===============================
> 
>       x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/254910c41ec0fbf36db86b377d3f237e4d176515 |     
>      aarch64 |                        unknown | TIM | http://autobuild.buildroot.net/results/8f153e997b5c371817388f02dbe6c7fea8857f52 |     

I'm using your patch "hung build: convert to monitor thread" v2 and it seems
there is a corner case with boost package and the sanitize rpath script.

I don't understand why the timeout is trigged here.

I've rebuilt boost on the autobuilder without any issue.

Do you have an idea ?

Here is the log for the instance-0 (boost):
[Wed, 03 Jan 2018 16:33:07] INFO: generate the configuration
KCONFIG_SEED=0x9710AB02
[Wed, 03 Jan 2018 16:34:04] INFO: build started
[Wed, 03 Jan 2018 21:20:34] INFO: build hung
[Wed, 03 Jan 2018 21:20:40] INFO: build timed out [-9]
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed

  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0     0    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--     0
  0     0    0     0    0     0      0      0 --:--:--  0:00:02 --:--:--     0
100 29030    0     0  100 29030      0   9676  0:00:03  0:00:03 --:--:--  7818
100 29274    0   244  100 29030     81   9676  0:00:03  0:00:03 --:--:--  7823

Best regards,
Romain
