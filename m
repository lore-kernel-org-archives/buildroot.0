From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 12 Oct 2014 16:03:44 -0300
Subject: [Buildroot] [PATCH 1/3] qemu-system: new package
In-Reply-To: <20141012171752.29414e94@free-electrons.com>
References: <1399148415-27648-1-git-send-email-gustavo@zacarias.com.ar>
 <20141012171752.29414e94@free-electrons.com>
Message-ID: <543AD090.3000107@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/12/2014 12:17 PM, Thomas Petazzoni wrote:

> We discussed this patch series during the Buildroot meeting. PATCH 3/3
> is Superseded, as you have updated the Qemu defconfigs many time since
> then.
> 
> Regarding PATCH 1/3 and PATCH 2/3, we continue to believe it should be
> part of the qemu package itself, and not a separate qemu-system. Since
> I know you are not interested in doing this work, Yann E. Morin has
> said he was interested in doing this, once his current patch series
> adding support for qemu-system on the target has been merged.
> 
> Consequently, I will mark your patches as 'Changes Requested' in
> patchwork. Of course, if in the mean time you change your mind and
> decide to implement host qemu-system as part of the qemu package, we'd
> be happy to receive your patches! :-)

I don't agree on the reasoning:
You can't use different versions for host and non-host packages in a
clean way: that alone and the fact that no single qemu version can cover
all of the emulations would make the single package pointless.
It's all fine and nice to strive to get qemu fixed but it's an
unrealistic objective, new architectures and variants together with old
emulations that seldomly are used/tested will continue to make this a
moving target.
Time and time again this has proven to be the case so leaving a fixed
version for the package will make it pointless, we can just tell people
to use some random distro version and get the same result which would
render the host package with no sense to be.
And changing the package version for the target because the host version
needs some special care plays into the changing results arena.
Granted it's not a common use-case to have both, but it's doing it
regarless.
You want all emulations to work, not just some depending on weather,
wind and pollen count.
So on my side i'm not planning to do anything with this decision.
Regards.
