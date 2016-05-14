From: Nathaniel Roach <nroach44@gmail.com>
Date: Sat, 14 May 2016 12:55:33 +0800
Subject: [Buildroot] [v3] package/quagga: Fix directories and permissions
In-Reply-To: <20160513224001.2d6075f7@free-electrons.com>
References: <1463129781-676-1-git-send-email-nroach44@gmail.com>
 <20160513224001.2d6075f7@free-electrons.com>
Message-ID: <B252F036-BFBF-4327-A9B4-7B83E9BE3120@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I agree, however I'm not using busybox init on any of my systems and don't feel capable of writing an init script without just copying someone else's implementation completely.

On 14 May 2016 4:40:01 AM AWST, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>Hello,
>
>On Fri, 13 May 2016 16:56:21 +0800, Nathaniel Roach wrote:
>> Quagga runs as the "quagga" user, but it also needs to modify files
>> in /etc and /var - config files, pid files and vty sockets for vtysh.
>> 
>> Tell the configure script the right folders to use, create the
>> user, fix the permissions, and then let systemd know (if needed).
>> 
>> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
>> 
>> ---
>> Changes v1 -> v2:
>>  - Minor nits (Thomas)
>>  - Add some comments about why permissions are changed as such
>
>Applied to master, thanks. However, I still think that an init script
>would be useful: the default for Buildroot is to use the Busybox init,
>and as it is today, nothing is starting quagga and making sure
>that /var/run/quagga is owned by the quagga user.
>
>Thomas
>-- 
>Thomas Petazzoni, CTO, Free Electrons
>Embedded Linux, Kernel and Android engineering
>http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160514/b0d82bfc/attachment.html>
