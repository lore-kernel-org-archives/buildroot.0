From: Daniel Mack <zonque@gmail.com>
Date: Tue, 7 Jun 2011 10:34:37 +0200
Subject: [Buildroot] Anyone working on adding systemd and NetworkManager?
In-Reply-To: <20110604103531.57826da3@surf>
References: <BANLkTiksOpT2qCKdGm7QUji+jBU=Fzmzig@mail.gmail.com>
	<20110604103531.57826da3@surf>
Message-ID: <BANLkTi=A5acKLSjS0kEDK-b8uJ7R8ht33g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 4, 2011 at 10:35 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue, 31 May 2011 11:16:04 +0200
> Daniel Mack <zonque@gmail.com> wrote:
>
>> The subject says it all: did anyone look into what it takes to add
>> systemd to buildroot as an alternative to the SysV init scripts? It
>> seems that that would make a lot of sense for embedded devices.
>>
>> Also, NetworkManager is being used more and more as the standard API
>> to configure network configuration, Wifi access points and the like -
>> has anyone used that package with buildroot yet?
>
> I haven't heard of anyone packaging those two components, and they
> would definitely be useful.

The problem with newer version of udev is that they depend on epoll.
As far as I got it, there was work done on this in uclibc just
recently. So I will wait for the next release and try again.

> However, what about connman instead of NetworkManager ? It seems like
> connman is more embedded/mobile oriented than NetworkManager, no?

connman indeed looks more appropriate. I'll test that and come up with patch.

Thanks,
Daniel
