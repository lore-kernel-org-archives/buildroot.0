From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Nov 2013 12:41:59 +0100
Subject: [Buildroot] [PATCH 4/4] support/kconfig: bump to kconfig from
	linux-3.12
In-Reply-To: <eabc0ac6fc62b091a78c1f78a987fbe3962e0c95.1384386575.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Thu, 14 Nov 2013 00:53:35 +0100")
References: <cover.1384386575.git.yann.morin.1998@free.fr>
 <eabc0ac6fc62b091a78c1f78a987fbe3962e0c95.1384386575.git.yann.morin.1998@free.fr>
Message-ID: <87li0r1a7s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > With this, we can trash our probability patch, it's now upstream.
 > Refresh a few other patches.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks. Strangely enough pwclient doesn't like the patch:

pwclient get 291086
Traceback (most recent call last):
  File "/home/peko/bin/pwclient", line 500, in <module>
    main()
  File "/home/peko/bin/pwclient", line 465, in main
    action_get(rpc, patch_id)
  File "/home/peko/bin/pwclient", line 238, in action_get
    s = rpc.patch_get_mbox(patch_id)
  File "/usr/lib/python2.7/xmlrpclib.py", line 1224, in __call__
    return self.__send(self.__name, args)
  File "/usr/lib/python2.7/xmlrpclib.py", line 1578, in __request
    verbose=self.__verbose
  File "/usr/lib/python2.7/xmlrpclib.py", line 1264, in request
    return self.single_request(host, handler, request_body, verbose)
  File "/usr/lib/python2.7/xmlrpclib.py", line 1297, in single_request
    return self.parse_response(response)
  File "/usr/lib/python2.7/xmlrpclib.py", line 1467, in parse_response
    p.feed(data)
  File "/usr/lib/python2.7/xmlrpclib.py", line 557, in feed
    self._parser.Parse(data, 0)
xml.parsers.expat.ExpatError: not well-formed (invalid token): line 2069, column 1

But it seems to work OK if I use the mbox link on the patchwork
website.

Jeremy, any ideas?

-- 
Bye, Peter Korsgaard
