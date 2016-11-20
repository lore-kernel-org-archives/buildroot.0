From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 20 Nov 2016 07:50:46 -0200
Subject: [Buildroot] [PATCH] core/br2-external: restore compatibility
 with old distros
References: <CABa6e=pVPPTJeH+nX5LOaDtVf8iiZni8qOt+iHcwhUHhCFKqyg@mail.gmail.com>
Message-ID: <583171f66699f_1d593f9eaa9ff3ac1357e@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam,

On Sun, Nov 20, 2016 at 06:40 AM, Cam Hutchison wrote:

> Thanks for the testing, Ricardo.
> 
> Noted about the workflow errors. I was just throwing this out for
> comment right now. I can spin it properly if needed, but as you say -
> also easily adjusted on commit.
> 
> One thing I wasn't sure about and forgot to comment on when I posted
> was the invocation of uniq(1). I'm using some GNU options and I'm not
> sure when they were added to GNU uniq and what version RHEL5 has.
> 
> Can you confirm that you can invoke without error:
> $ uniq --skip-fields=1 --all-repeated

Sure.

[ricardo at centos5 ~]$ grep release /etc/issue
CentOS release 5.11 (Final)
[ricardo at centos5 ~]$ uniq --version | grep uniq
uniq (GNU coreutils) 5.97
[ricardo at centos5 ~]$ uniq --skip-fields=1 --all-repeated

No error message is generated and uniq is waiting for stdin.

[ricardo at centos5 ~]$ uniq --help
Usage: uniq [OPTION]... [INPUT [OUTPUT]]
Discard all but one of successive identical lines from INPUT (or
standard input), writing to OUTPUT (or standard output).

Mandatory arguments to long options are mandatory for short options too.
  -c, --count           prefix lines by the number of occurrences
  -d, --repeated        only print duplicate lines
  -D, --all-repeated[=delimit-method] print all duplicate lines
                        delimit-method={none(default),prepend,separate}
                        Delimiting is done with blank lines.
  -f, --skip-fields=N   avoid comparing the first N fields
  -i, --ignore-case     ignore differences in case when comparing
  -s, --skip-chars=N    avoid comparing the first N characters
  -u, --unique          only print unique lines
  -w, --check-chars=N   compare no more than N characters in lines
      --help     display this help and exit
      --version  output version information and exit

A field is a run of whitespace, then non-whitespace characters.
Fields are skipped before chars.

Report bugs to <bug-coreutils@gnu.org>.
[ricardo at centos5 ~]$

> 
> If not, the generate_dupes() function will need to be fixed.
> 

Regards,
Ricardo
