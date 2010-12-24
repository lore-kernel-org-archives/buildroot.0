From: Heiko Zuerker <heiko@zuerker.org>
Date: Fri, 24 Dec 2010 07:29:47 -0600
Subject: [Buildroot] busybox, hardcoded config
In-Reply-To: <20101224085246.0a2d8640@surf>
References: <20101223073318.154656bz82tuap44@www.home.zuerker.org>
	<20101224085246.0a2d8640@surf>
Message-ID: <20101224072947.17101by6ka661utc@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

Quoting Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> On Thu, 23 Dec 2010 07:33:18 -0600
> Heiko Zuerker <heiko@zuerker.org> wrote:
>
>> there was recently a discussion on the topic of automatically turning
>> on specific kernel features, which can cause some problems.
>>
>> This is very heavily done in busybox, i.e. nfs support for mount keeps
>> being turned on by the makefile. At least in my case this is causing
>> me some grief.
>
> Could you detail why that specific behaviour on NFS is causing
> problems ?

(A rather lengthy explanation)

My situation is a bit different than most people using buildroot.
I'm trying to use buildroot for a full blown, security focused distribution.
Since Devil-Linux is already well established, I have to reproduce the  
current features.

Busybox is only used as a static binary in the initramfs to initialize  
the system, find the configuration and the distribution media.

We're using the full blown glibc and busybox can't be statically  
compiled if nfs support is on, since it needs it for dns resolution.

>> I think we really should keep this automatically setting of
>> configurations to an absolute minimum. Can't we rely on the person
>> configuring buildroot, to set the correct options he or she needs for
>> example in busybox or the kernel?
>
> There's no one-size-fits-all answer to this question. On the one hand,
> we can't make everything automatic and we have to rely on the user to
> make sane choices. On the other hand, we also want configurations built
> by default to make sense as much as possible.
>
> I'm not terribly happy about the BR2_PACKAGE_BUSYBOX_DONT_CHANGE_CONFIG
> you proposed, but it's true I don't really have a better proposal.
> Maybe we should automatically disable the automatic tuning if the
> Busybox configuration file is not in package/busybox/ (i.e when it's a
> non-Buildroot provided configuration file) ? But maybe this behaviour
> is a bit tricky.

This may cause other people more issues. I'm sure not everybody can  
used the provided config files and has to do some minor adjustments,  
but still relies on some of the auto-config features.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
