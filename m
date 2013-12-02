From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 02 Dec 2013 08:44:56 -0300
Subject: [Buildroot] [PATCH] tar: bump to version 1.27.1
In-Reply-To: <87ob4zr0a2.fsf@dell.be.48ers.dk>
References: <1385980868-2000-1-git-send-email-gustavo@zacarias.com.ar>
 <87ob4zr0a2.fsf@dell.be.48ers.dk>
Message-ID: <529C72B8.1080602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/2013 07:54 AM, Peter Korsgaard wrote:

> I'm not sure why it thinks it needs automake as we don't patch anything.
> 
> Any ideas?

Because host-tar is a different archive (cpio) and the extraction
command isn't respecting modification times.
Can be fixed by cpio -i --preserve-modification-time though.
I'll send a V2.
Regards.
