From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 03 Mar 2014 22:44:44 -0300
Subject: [Buildroot] [RFC,
 PATCH 2/8] package/dropbear: Add separate configuration options for
 client and server
In-Reply-To: <53152757.2020707@ozlabs.org>
References: <1389862338.918265.958087681541.2.gpush@pablo>
 <53151AFC.3010402@zacarias.com.ar> <53152757.2020707@ozlabs.org>
Message-ID: <5315300C.60102@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/03/2014 10:07 PM, Jeremy Kerr wrote:

> Hi Gustavo,

Hi Jeremy.

>> Normally we don't make initscript installation an option
> 
> I think dropbear is a bit exceptional here, as both server and client
> are in the one package.
> 
>> and since the
>> dropbear package options are essentially a no-op what's the point?
> 
> There are some scenarios where there's no point starting a SSH server
> (in my case, it's because there's no persistent storage, so no
> persistent host keys). However, I'd still like a ssh/scp client to be
> available.

Well you'll want at least one of the options of dropbear, there's no
point in excluding both.
My common sense tells me you'll always want the client anyway, it's no
security threat or space-consuming menace, so why not add just a SERVER
option maybe?
BR2_PACKAGE_DROPBEAR -> builds and install the client portion.
BR2_PACKAGE_DROPBEAR_SERVER -> installs the server bits (default=y for
compatibility reasons).
Let's see others chiming in though...

>> (if you don't want sshd to startup on boot you can use a post build
>> script to just remove the initscript from the target, that's the
>> recommended way).
> 
> But isn't something that will go upstream and be available in a
> defconfig, right?

That's still open to debate, until now all defconfigs were supposed to
be minimal, but there's a growing consensus that featured or demo
defconfigs are desired and useful.
It's just a matter of doing it right and documenting it at this point i
think.
Regards.
