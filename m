From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 27 May 2016 16:58:45 +0100
Subject: [Buildroot] gstreamer-1.0 and egl
In-Reply-To: <63233783-a7e5-8971-7403-4f52cb5af733@gmail.com>
References: <63233783-a7e5-8971-7403-4f52cb5af733@gmail.com>
Message-ID: <57486EB5.90406@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marco,

On 27/05/16 16:49, Marco Trapanese wrote:
[...]

> Another weird thing about gstreamer. The very first time I launch any
> gstreamer command I get this errors:
> 
>> /usr/libexec/gstreamer-1.0/gst-plugin-scanner: symbol 'rpc_begin':
>> can't resolve symbol

[..]

> 
> 
> The second time it acts as expected.
> Any idea?

the first time fails and the second time works..., it looks to me as a
race-condition problem. Try with only one job for make:

BR2_JLEVEL=1

You can set it in the "Build options" menu.

Regards,

Vincent.

> Thanks in advance
> Marco
> 
> 
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
