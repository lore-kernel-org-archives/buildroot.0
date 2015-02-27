From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Feb 2015 16:33:25 -0300
Subject: [Buildroot] eth0 missing ? [SOLVED]
In-Reply-To: <297D02207CF04F1EBF5136C4CA389165@JohanW7>
References: <974034368E9D498B93AD300538173FB3@JohanW7>
 <54EDD64B.2000808@zacarias.com.ar> <297D02207CF04F1EBF5136C4CA389165@JohanW7>
Message-ID: <54F0C685.2010107@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/27/2015 04:28 PM, Sagaert Johan wrote:

> Hi 
> 
> In 2015.02-rc1 /run was introduced in the skeleton and an tmpfs entry was added in fstab.
> 
> There was an fstab file in my overlay file system that had overwritten the one from the skeleton
> so that /run existed on the real filesystem instead of been mounted as tmpfs.
> This caused the different pid files to remain between boots and confused eudev.
> 
> Best regards,
> Johan

Hi.
Buildroot assumes /run is volatile hence doesn't do any cleanup tasks on
it at boot time.
Regards.
