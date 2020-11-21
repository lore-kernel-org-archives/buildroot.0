From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 22 Nov 2020 00:31:07 +0100
Subject: [Buildroot] [PATCH v4 5/5] board: add nvidia jetson nano support
In-Reply-To: <CA+h8R2rhEj=3+tKwh0gnDT5gXP8=nKEuhfrMWy6o597jS+JdJQ@mail.gmail.com>
References: <20201119075328.8599-1-christian@paral.in>
 <20201119075328.8599-5-christian@paral.in>
 <be9e5bd9-53b4-19cf-092f-c310a1f4d904@gmail.com>
 <CA+h8R2rhEj=3+tKwh0gnDT5gXP8=nKEuhfrMWy6o597jS+JdJQ@mail.gmail.com>
Message-ID: <cdf0817c-713e-da4e-2c63-d0cac4d3431a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

Le 21/11/2020 ? 22:01, Christian Stewart a ?crit?:
> Hi Romain,
> 
> On Sat, Nov 21, 2020 at 3:03 AM Romain Naour <romain.naour@gmail.com> wrote:
> 
> [snip]
> 
>>> +
>>> +# prefer root partprobe
>>> +PARTPROBE=partprobe
>>> +if [ -f /usr/sbin/partprobe ]; then
>>> +    PARTPROBE=/usr/sbin/partprobe
>>> +fi
>>
>> This requires partprobe installed on the build machine.
>> partprobe is available in HOST_DIR (see HOST_DIR/sbin/partprobe)
> 
> I'll fix this for the next revision - but - actually the reason why
> this is in here, is because the buildroot-produced partprobe was
> segfaulting on two of my machines.

partprobe built by Buildroot must work on any host.
Can you give some details about this issue ? (Linux distro etc)
Can you share the log ?

Best regards,
Romain


> 
> Best,
> Christian
> 
