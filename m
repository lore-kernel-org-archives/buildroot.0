From: Chris Lesiak <chris.lesiak@licor.com>
Date: Mon, 17 Dec 2018 21:24:47 +0000
Subject: [Buildroot] [PATCH v2] package/openssh: Add sysusers.d snippet
In-Reply-To: <20181217181319.GD2951@scaer>
References: <20180123232221.6106-1-chris.lesiak@licor.com>
 <20180216181016.8747-1-chris.lesiak@licor.com> <20181216134502.GB2384@scaer>
 <f71a4a61-0cca-0fa3-a9f7-bfbc1d8ad6af@licor.com>
 <20181217181319.GD2951@scaer>
Message-ID: <9cff125b-6458-ae1f-e7c2-27c96c843297@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/17/18 12:13 PM, Yann E. MORIN wrote:

> [--SNIP--]
>
> Currently, the set of users created by FOO_USERS and the set of users
> created by sysusers.d files is not consistent. Your proposed patch fixes
> it for openssh only, but:
>
>    - the user definition is duplicated: one in the .mk, one in the
>      sysusers.d file, so becomes a maintenacne burden (e.g. should we
>      need to create anotehr user for it, for example)
>
>    - other packages are left out in the cold.
>
> So, I'd like we find a solution so that the set of users installed in
> /etc/paswd and the set of users created by sysusers.d are identical.
>
> I don't have a good suggestion, though... :-/
>
> Regards,
> Yann E. MORIN.


I haven't tried this yet, but maybe the systemd Dynamic Users feature is 
a better solution.

See: http://0pointer.net/blog/dynamic-users-with-systemd.html

The user name would still appear in two places (the make fragment and 
the service file), but it could eliminate the need for both the 
sysusers.d and tmpfiles.d snippets.

-- 
Chris Lesiak
Principal Design Engineer, Software
LI-COR Biosciences
4647 Superior Street
Lincoln, NE 68504 USA
chris.lesiak at licor.com
