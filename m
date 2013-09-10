From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Tue, 10 Sep 2013 18:49:14 -0500
Subject: [Buildroot] Building Manual Errors
Message-ID: <OF433C040C.2486075F-ON86257BE2.00813B52-86257BE2.0082DB6E@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been trying to build the manual for buildroot using 'make manual' 
using two different machines that have Ubuntu 10.04 LTS and 12.04 LTS.

On Ubuntu 10.04 there was an unlisted dependancy with python-argparse and 
even when I installed both python-argparse and asciidocs I still wasn't 
able to build the HTML version of the manual but the text version worked. 
Below is the error I got:

>>>   Generating HTML manual...
Traceback (most recent call last):
  File "/usr/bin/a2x", line 730, in <module>
    a2x.execute()
  File "/usr/bin/a2x", line 294, in execute
    self.__getattribute__('to_'+self.format)()  # Execute to_* functions.
  File "/usr/bin/a2x", line 493, in to_xhtml
    self.copy_resources(xhtml_file, src_dir, self.destination_dir)
  File "/usr/bin/a2x", line 443, in copy_resources
    lambda attrs: attrs.get('type') == 'text/css')
  File "/usr/bin/a2x", line 235, in find_resources
    parser.feed(open(f).read())
  File "/usr/lib/python2.6/HTMLParser.py", line 108, in feed
    self.goahead(0)
  File "/usr/lib/python2.6/HTMLParser.py", line 148, in goahead
    k = self.parse_starttag(i)
  File "/usr/lib/python2.6/HTMLParser.py", line 249, in parse_starttag
    attrvalue = self.unescape(attrvalue)
  File "/usr/lib/python2.6/HTMLParser.py", line 387, in unescape
    return re.sub(r"&(#?[xX]?(?:[0-9a-fA-F]+|\w{1,8}));", replaceEntities, 
s)
  File "/usr/lib/python2.6/re.py", line 151, in sub
    return _compile(pattern, 0).sub(repl, string, count)
UnicodeDecodeError: 'ascii' codec can't decode byte 

On my Ubuntu 12.04 machine I can succesfully build the HTML version of the 
manual but not the text version

user at ubuntu:~/projects/buildroot/mainline$ make manual-txt
Writing the target-packages list in:
        output/docs/manual/.build/package-list.txt
Writing the host-packages list in:
        output/docs/manual/.build/host-package-list.txt
Writing the deprecated list in:
        output/docs/manual/.build/deprecated-list.txt
a2x: ERROR: w3m -cols 70 -dump -T text/html -no-graph 
/home/user/projects/buildroot/mainline/output/docs/manual/manual.text.html 
> /home/user/projects/buildroot/mainline/output/docs/manual/manual.text 
returned non-zero exit status 127
make: *** [output/docs/manual/manual.text] Error 1

I've seen in the manual that there is an issue with building the manual 
with debain but it really doesn't explain what that issue. I tried 
searching the mailing list for this issue along with bugzilla but came up 
empty handed in finding the exact issue. Its not the end of the world for 
me since I can kind of work around. Also if somebody has a known working 
configuration for building the manual that would be helpful to know.

Another random thought, is there any plans to build all the tools needed 
for doing compile of the manual within buildroot so then we are not 
dependent on the different distros of linux for building the manuals?

Thanks,
-Ryan



Ryan J Barnett / Software Engineer / Platform SW 
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130910/821d6f2d/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: image/gif
Size: 2004 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130910/821d6f2d/attachment.gif>
