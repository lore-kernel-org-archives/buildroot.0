From: Thierry Bultel <thierry.bultel@wanadoo.fr>
Date: Tue, 16 Oct 2012 18:15:36 +0200
Subject: [Buildroot] no /dev/console;
 /dev/null when booting with initrd of type 'ext2'
In-Reply-To: <20121016142342.GA2131@mail.sceen.net>
References: <507D6C50.4060607@wanadoo.fr>
 <20121016142342.GA2131@mail.sceen.net>
Message-ID: <507D8828.4020007@wanadoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 16/10/2012 16:23, Richard Braun a ?crit :
> On Tue, Oct 16, 2012 at 04:16:48PM +0200, Thierry Bultel wrote:
>> Would the solution be to always have these inodes created in
>> 'device_table.txt' ?
>> (Works in my case, I do not plan to use the static table)
> The devtmpfs "file system" is usually a better approach.
>
I have CONFIG_TMPFS and , and CONFIG_DEVTMPFS_MOUNT, and it works with 
everything but initrd of type "ext2"

I am thus asking 2 questions to myself
1) Why does the ISO image imply an ext2 initrd , instead of a cpio ?
2) Why does ext2 not work with devtmpfs (the answer is likely somewhere 
in the kernel sources and I will take a look as well) ?

Regards
Thierry
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121016/e479d661/attachment.html>
