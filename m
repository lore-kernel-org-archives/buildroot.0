From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Sep 2013 17:03:45 +0200
Subject: [Buildroot] Building Manual Errors
In-Reply-To: <OF433C040C.2486075F-ON86257BE2.00813B52-86257BE2.0082DB6E@rockwellcollins.com>
References: <OF433C040C.2486075F-ON86257BE2.00813B52-86257BE2.0082DB6E@rockwellcollins.com>
Message-ID: <CAAXf6LVf+pFDG3-tvuWMOPJT8f4ErbfBfmg33hAaZuZtBT9XGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan, Samuel,


On Wed, Sep 11, 2013 at 1:49 AM, <rjbarnet@rockwellcollins.com> wrote:

> I've been trying to build the manual for buildroot using 'make manual'
> using two different machines that have Ubuntu 10.04 LTS and 12.04 LTS.
>
> On Ubuntu 10.04 there was an unlisted dependancy with python-argparse and
> even when I installed both python-argparse and asciidocs I still wasn't
> able to build the HTML version of the manual but the text version worked.
> Below is the error I got:
>
> >>>   Generating HTML manual...
> Traceback (most recent call last):
>   File "/usr/bin/a2x", line 730, in <module>
>     a2x.execute()
>   File "/usr/bin/a2x", line 294, in execute
>     self.__getattribute__('to_'+self.format)()  # Execute to_* functions.
>   File "/usr/bin/a2x", line 493, in to_xhtml
>     self.copy_resources(xhtml_file, src_dir, self.destination_dir)
>   File "/usr/bin/a2x", line 443, in copy_resources
>     lambda attrs: attrs.get('type') == 'text/css')
>   File "/usr/bin/a2x", line 235, in find_resources
>     parser.feed(open(f).read())
>   File "/usr/lib/python2.6/HTMLParser.py", line 108, in feed
>     self.goahead(0)
>   File "/usr/lib/python2.6/HTMLParser.py", line 148, in goahead
>     k = self.parse_starttag(i)
>   File "/usr/lib/python2.6/HTMLParser.py", line 249, in parse_starttag
>     attrvalue = self.unescape(attrvalue)
>   File "/usr/lib/python2.6/HTMLParser.py", line 387, in unescape
>     return re.sub(r"&(#?[xX]?(?:[0-9a-fA-F]+|\w{1,8}));", replaceEntities,
> s)
>   File "/usr/lib/python2.6/re.py", line 151, in sub
>     return _compile(pattern, 0).sub(repl, string, count)
> UnicodeDecodeError: 'ascii' codec can't decode byte
>


I found this:
https://groups.google.com/forum/#!topic/asciidoc/sPvOIQzhY2Q

There, they mention that asciidoc 8.6.3 fixes the issue. Could you verify
that the Ubuntu 10.04 system has asciidoc < 8.6.3, while the Ubuntu 12.04
system has >= 8.6.3 ?

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130919/6b1ac432/attachment.html>
