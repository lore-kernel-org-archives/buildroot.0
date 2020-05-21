From: Michael Walle <michael@walle.cc>
Date: Thu, 21 May 2020 23:21:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: remove hardcoded
 interface from config to args
In-Reply-To: <20200521153619.5466d4e6@windsurf.home>
References: <20200520051647.18530-1-heiko.thiery@gmail.com>
 <20200521153619.5466d4e6@windsurf.home>
Message-ID: <244d4bb9817b608fa5f994a05c8c70c5@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Am 2020-05-21 15:36, schrieb Thomas Petazzoni:
> Hello Heiko,
> 
> On Wed, 20 May 2020 07:16:48 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
> 
>> Interface configuration is hard coded in the config file. This will
>> throw an error when this interace (eth0) is not present.
>> 
>> This patch removes the interface to be used from the config and 
>> appends it
>> to the PTP4L_ARGS. With this the custom arguments can be set via
>> /etc/defaults/ptp4l.
> 
> Well, you can also just as well provide your custom linuxptp.cfg in a
> rootfs overlay, no?

You can, but then you'd have to copy the configuration on each and every
board which has another interface name than "eth0". That being said, I'd
also prefer it to have the normal default config, shipped with linuxptp.
Like at least debian does too.

-michael

> 
> Also, your change to linuxptp.cfg kind of breaks what is explained in
> linuxptp.cfg:
> 
> # By default synchronize time in slave-only mode using UDP and hardware 
> time
> # stamps on eth0. If the difference to master is >1.0 second correct by
> # stepping the clock instead of adjusting the frequency.
> 
> Thomas

-- 
-michael
