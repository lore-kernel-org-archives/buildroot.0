From: Daniel Laird <daniel.j.laird@nxp.com>
Date: Tue, 27 May 2008 12:32:11 -0700 (PDT)
Subject: [Buildroot] Q: How to change include paths?
In-Reply-To: <C681C76E0D5F1E4BB01DE79E0A80EEC7765D34@usrdes03.ebgroup.elektrobit.com>
References: <C681C76E0D5F1E4BB01DE79E0A80EEC7765D34@usrdes03.ebgroup.elektrobit.com>
Message-ID: <17498220.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I have been building Cairo and DirectFB recently for my platform.

I have found the include paths to be correct as long as pkg config finds the
.pc files properly.  The other issue I had was the build order and I posted
a patch that made sure directfb is built first before cairo is compiled. 
The patches I posted also stopped cairo etc from redefining PKG_CONFIG_*
variables.

I hope these get adopted by buildroot.  Maybe try these and then see if the
problem goes away.

Cheers
Dan Laird


Michael.Forkey wrote:
> 
> What is the correct way/place to change the include paths for a package
> build in buildroot?
> 
> When I build cairo with directfb support I get a build error. It expects
> directfb.h to be in /staging_dir/include/directfb but it is actually in
> /staging_dir/usr/include/directfb.
> 
> How can I fix this?
> 
> Thanks,
> mf
> 
> 
> ----------------------------------------------------------------
> Please note: This e-mail may contain confidential information
> intended solely for the addressee. If you have received this
> e-mail in error, please do not disclose it to anyone, notify
> the sender promptly, and delete the message from your system.
> Thank you.
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 

-- 
View this message in context: http://www.nabble.com/Q%3A-How-to-change-include-paths--tp17495303p17498220.html
Sent from the BuildRoot mailing list archive at Nabble.com.
