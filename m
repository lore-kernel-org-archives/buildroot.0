From: Gilles <gilles@whospot.com>
Date: Mon, 21 Jul 2014 14:35:11 -0700
Subject: [Buildroot] issues without busybox
In-Reply-To: <53CD77E8.7050208@zacarias.com.ar>
References: <98386AE2-7424-4E70-8839-6B642B9938F4@whospot.com>
 <20140721221555.72df12ca@free-electrons.com>
 <53CD77E8.7050208@zacarias.com.ar>
Message-ID: <3BB80F5F-275A-4495-8E75-40827CA53A50@whospot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Jul 21, 2014, at 13:28 , Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

> On 07/21/2014 05:15 PM, Thomas Petazzoni wrote:
>> I believe one direction we should potentially investigate is to have
>> one common skeleton for the base stuff, and then separate additional
>> skeletons for busybox init, sysv init and systemd init.
> 
> Hi.
> I think i've already mentioned i'm planning on a proposal to revamp the
> init system/initscript options.
> The idea would be to make them consistent and document how a proper
> initscript should be made, and get them all in line with this.
> Also interesting would be to make them configurable, in many cases
> daemons have options and don't use a configuration file, so let's make
> one i say.


I don't know, there are already SO MANY alternatives to SystemV init with
event driven init like boot scripts, initNG, launchd (my favorite), SMF, runit, syscan, upstart, einit...
It's almost a full time job to stay on top of it all as it is.


> Actually let's make two :) A default file for read-only
> filesystem, and some another that overrides the default, good for RO
> filesystems which have a separate partition for that.
> We could make the start/stop order configurable too via a file similar
> to the device table, if this file lives in the target filesystem it
> could be nicer too - but well that depends on how far we'd like to go.
> The idea would be to use as much pure shell as possible for this to keep
> necessary dependencies to a minimum.
> Haven't thought out much of the systemd option yet, i need to dig
> somewhat deeper into it, or it could be handled separately since it's
> quite different from the usual inits.
> 
>> Regarding the specific issues you're raising here, I'm not exactly sure
>> how to solve them:
>> 
>> * For the network, we could make sysvinit depend on ifupdown, but this
>>   sounds a bit strong. Then it would mean that we should make the init
>>   script installation conditional. Or maybe installed just by ifupdown
>>   on one side, and busybox on the other side?
> 
> We can make the different BR2_INIT_* options select what's appropiate,
> if someone wants to "roll their own" they can select None.
> 
>> * Regarding start-stop-daemon, I believe all (most?) our init scripts
>>   rely on start-stop-daemon. So I'm not sure how to handle that...
> 
> We can throw a compatibility function/alias/script for different scenarios.
> But i think getting what we want to do on a clean sheet would be best,
> and then work on the patches.
> Regards.
