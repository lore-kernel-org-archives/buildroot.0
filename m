From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 09 Sep 2013 08:59:01 -0300
Subject: [Buildroot] Do if-post-up.d and if-pre-down.d belong in the
	device table?
In-Reply-To: <87r4czxf0c.fsf@dell.be.48ers.dk>
References: <CANxTyt6qrfH6ZbVEpJoAJjK50MYhvhez+prXB9LNzZR7ZqgVvg@mail.gmail.com>
 <87r4czxf0c.fsf@dell.be.48ers.dk>
Message-ID: <522DB805.2090005@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/08/2013 04:57 PM, Peter Korsgaard wrote:

>  Danomi> I think having the extra two directories in the device table might mislead
>  Danomi> people into thinking that scripts there will be executed.  Or have I
>  Danomi> misunderstood something?  For sure, it's not executing scripts from those
>  Danomi> places with busybox-1.21.1 ...
> 
>  Danomi> FYI, the busybox commit that added the "post-up" and "pre-down" support can be
>  Danomi> reviewed at:
> 
>  Danomi> http://lists.busybox.net/pipermail/busybox-cvs/2012-April/033401.html
> 
> It looks like you're right. Gustavo?

At the time lacking those directories resulted in a warning/error on
ifup/ifdown calls, which we do for loopback on boot so it was ugly.
However the "feature" was removed in subsequent busybox versions so it's
no longer an issue with the versions we currently ship.
Regards.

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
