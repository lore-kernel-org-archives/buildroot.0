From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Dec 2011 16:01:49 -0300
Subject: [Buildroot] root permissions issue (reformatted)
In-Reply-To: <32975350.post@talk.nabble.com>
References: <32975350.post@talk.nabble.com>
Message-ID: <4EE8F29D.7040706@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/14/11 15:58, dan robinson wrote:

> I have an NFS mounted root.  The directory, on the NFS server, does not have
> write permissions for 'other'.  I am not able to create a file when I run
> the command, 'touch one'.  On the NFS server side, I run 'chmod o+w' and
> that is shown in the second 'ls' command.  I can create a file.
> 
> If I 'su' to default, I can create files in that user's directory.
> 
> Note that the file, 'one', is owned by 65534.  I have included the
> /etc/passwd file.  This is -2 in 16 bits.  Noteworthy?
> 
> I ran the 'id' command.
> # id
> uid=0(root) gid=0(root) groups=0(root),10(wheel)
> 
> Ideas?
> 
> --dan robinson

Yes, "man exports" and look at the root_squash and no_root_squash option
descriptions.
Regards.
