From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 12 Mar 2015 20:09:13 -0300
Subject: [Buildroot] [PATCH] move random-seed from /etc to /var/lib
In-Reply-To: <8761a5hlbr.fsf@dell.be.48ers.dk>
References: <20150312002013.GA11018@vostro> <8761a5hlbr.fsf@dell.be.48ers.dk>
Message-ID: <55021C99.9070907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/12/2015 08:01 PM, Peter Korsgaard wrote:

> But if rootfs is RO, so will /var/lib then?
> 
> I would rather get rid of the static random_seed file instead. Seeding
> all Buildroot based devices with a RO rootfs from the same 512 bytes of
> data can hardly be helpful for security.
> 
> For a R/W rootfs, why would /var/lib be any better than /etc?

I'm still planning to revap the random initscript and throw some infra
there.
Who says we can't use /etc/default + /etc/config for this? We can tell
where to write randomness if it's available that way.
On the project side we can choose if we'll use a per-project (build
time) random seed or nothing at all, after all we can't know every
scenario out there.
Regards.
