From: Mark Constable <markc@renta.net>
Date: Thu, 09 Feb 2012 06:04:42 +1000
Subject: [Buildroot] FW: Buildroot RFS Login Question
In-Reply-To: <87bop9zrvp.fsf@macbook.be.48ers.dk>
References: <CB5771EE.2EBB%donald.poole@swri.org> <4F321CF0.7000305@renta.net>
 <87bop9zrvp.fsf@macbook.be.48ers.dk>
Message-ID: <4F32D55A.6010004@renta.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed 08 Feb 2012 17:49:46 EST, Peter Korsgaard wrote:
>  Mark> FWIW I find on a fresh install I have to login as "default" and then
>  Mark> "su -" to root.
>
> With the default skeleton the root user has an empty password, so you
> should be able to login as root on the console (not ssh, as that
> typically doesn't allow empty passwords).

Right, I was struggling to find the right inittab entry for a "normal" 
console
login and had used /bin/login which seems to demand a non-root login. 
Once
I tried this it let me in as root without a password...

tty1::respawn:/sbin/getty 38400 tty1

It would have saved me a lot of time if this entry was in /etc/inittab, 
even if
it was commented out.
