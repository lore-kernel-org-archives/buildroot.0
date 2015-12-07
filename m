From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Dec 2015 09:00:48 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151207015525.GH23754@vapier.lan> (Mike Frysinger's message of
 "Sun, 6 Dec 2015 20:55:25 -0500")
References: <20151202073542.GY23754@vapier.lan>
 <20151206214229.GE4023@free.fr> <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan>
Message-ID: <8737ver8lr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

Hi,

 >> > Unfortunately, we do have subdomains that are not https-enabled, and are
 >> > on another machine:
 >> >     http://autobuild.buildroot.org/
 >> 
 >> sources.buildroot.{org,net} is another example (even though that it
 >> normally only accessed from wget, so less critical).

 > there's really no reason you can't generate a cert for those domains using
 > let's encrypt.  let's encrypt doesn't require you to own the root domain,
 > just be in control of the web server the domain resolves to.

FYI, there also seems to be an issue with the git.* certificates and
atleast python on the box, as I get this when pushing:

Counting objects: 28, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (28/28), done.
Writing objects: 100% (28/28), 5.06 KiB | 0 bytes/s, done.
Total 28 (delta 19), reused 0 (delta 0)
remote: Traceback (most recent call last):
remote:   File "/usr/bin/irkerhook.py", line 499, in <module>
remote:     ship(extractor, commit, not notify)
remote:   File "/usr/bin/irkerhook.py", line 436, in ship
remote:     privmsg = unicode(metadata)
remote:   File "/usr/bin/irkerhook.py", line 74, in __unicode__
remote:     if urllib.urlopen(webview).getcode() == 404:
remote:   File "/usr/lib/python2.7/urllib.py", line 87, in urlopen
remote:     return opener.open(url)
remote:   File "/usr/lib/python2.7/urllib.py", line 213, in open
remote:     return getattr(self, name)(url)
remote:   File "/usr/lib/python2.7/urllib.py", line 364, in open_http
remote:     return self.http_error(url, fp, errcode, errmsg, headers)
remote:   File "/usr/lib/python2.7/urllib.py", line 377, in http_error
remote:     result = method(url, fp, errcode, errmsg, headers)
remote:   File "/usr/lib/python2.7/urllib.py", line 671, in http_error_301
remote:     return self.http_error_302(url, fp, errcode, errmsg, headers, data)
remote:   File "/usr/lib/python2.7/urllib.py", line 641, in http_error_302
remote:     data)
remote:   File "/usr/lib/python2.7/urllib.py", line 667, in redirect_internal
remote:     return self.open(newurl)
remote:   File "/usr/lib/python2.7/urllib.py", line 213, in open
remote:     return getattr(self, name)(url)
remote:   File "/usr/lib/python2.7/urllib.py", line 443, in open_https
remote:     h.endheaders(data)
remote:   File "/usr/lib/python2.7/httplib.py", line 1049, in endheaders
remote:     self._send_output(message_body)
remote:   File "/usr/lib/python2.7/httplib.py", line 893, in _send_output
remote:     self.send(msg)
remote:   File "/usr/lib/python2.7/httplib.py", line 855, in send
remote:     self.connect()
remote:   File "/usr/lib/python2.7/httplib.py", line 1274, in connect
remote:     server_hostname=server_hostname)
remote:   File "/usr/lib/python2.7/ssl.py", line 352, in wrap_socket
remote:     _context=self)
remote:   File "/usr/lib/python2.7/ssl.py", line 579, in __init__
remote:     self.do_handshake()
remote:   File "/usr/lib/python2.7/ssl.py", line 816, in do_handshake
remote:     match_hostname(self.getpeercert(), self.server_hostname)
remote:   File "/usr/lib/python2.7/ssl.py", line 275, in match_hostname
remote:     % (hostname, dnsnames[0]))
remote: ssl.CertificateError: hostname 'git.busybox.net' doesn't match 'git.buildroot.org'
To ssh://buildroot.net/var/lib/git/buildroot.git
   f8daafd..1682aee  master -> master

-- 
Venlig hilsen,
Peter Korsgaard 
