From: Chris Kerios <ckerios@gmail.com>
Date: Wed, 29 Feb 2012 17:24:48 -0500
Subject: [Buildroot] Buildroot 2012.02-rc3 released
In-Reply-To: <CAJJ6jxtTZkfp7JYN_3aisaYGYufe6EkWhAmfkEOc-vNGfqsczA@mail.gmail.com>
References: <87ehtg2r6n.fsf@macbook.be.48ers.dk>
 <877gz6drz9.fsf@macbook.be.48ers.dk>
 <CAJJ6jxtawrULPdNUykruT4azk68_ZgFMRf6UwDJNH0D=AckBJQ@mail.gmail.com>
 <201202291004.49771.minimod@morethan.org>
 <CAJJ6jxtTZkfp7JYN_3aisaYGYufe6EkWhAmfkEOc-vNGfqsczA@mail.gmail.com>
Message-ID: <CAKyeDQ-KQFUfOO+E4fKDjhsUXguxcxrBoDu2UB62UUZmYpNUjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 29, 2012 at 11:22 AM, Steve Calfee <stevecalfee@gmail.com> wrote:
> On Wed, Feb 29, 2012 at 8:04 AM, Michael S. Zick <minimod@morethan.org> wrote:
>> On Wed February 29 2012, Steve Calfee wrote:
>>> On Tue, Feb 28, 2012 at 11:22 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>> >>>>>> "Steve" == Steve Calfee <stevecalfee@gmail.com> writes:
>>> >
>>> > Hi,
>>> >
>>> > ?>> http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3
>>> > ?>>
>>> > ?Steve> There seems to be something wrong with the servers. I cannot access
>>> > ?Steve> the url above.
>>> >
>>> > ?Steve> I am also having similar problems with git access:
>>> >
>>> > ?Steve> me:~/nobu/br/dockstar/tools$ git remote -v
>>> > ?Steve> origin ? ?http://git.buildroot.net/buildroot (fetch)
>>> > ?Steve> origin ? ?http://git.buildroot.net/buildroot (push)
>>> >
>>> > ?Steve> me:~/nobu/br/dockstar/tools$ git fetch
>>> > ?Steve> error: Couldn't resolve host 'git.buildroot.net' while accessing
>>> > ?Steve> http://git.buildroot.net/buildroot/info/refs
>>> >
>>> > ?Steve> fatal: HTTP request failed
>>> >
>>> > DNS problems at your side? The *.uclibc.org DNS has recently moved from
>>> > Eriks own machine to the osuosl.org people.
>>> >
>>> > It works here:
>>> >
>>> > host -a git.buildroot.net
>>> > Trying "git.buildroot.net"
>>> > ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 33511
>>> > ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
>>> >
>>> > ;; QUESTION SECTION:
>>> > ;git.buildroot.net. ? ? ? ? ? ? IN ? ? ?ANY
>>> >
>>> > ;; ANSWER SECTION:
>>> > git.buildroot.net. ? ? ?5279 ? ?IN ? ? ?CNAME ? buildroot.uclibc.org.
>>> >
>>> > wget 'http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3'
>>> > --2012-02-29 08:21:16-- ?http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3
>>> > Resolving git.buildroot.net (git.buildroot.net)... 140.211.167.224
>>> > Connecting to git.buildroot.net (git.buildroot.net)|140.211.167.224|:80... connected.
>>> > HTTP request sent, awaiting response... 200 OK
>>> > Length: 55525 (54K) [text/plain]
>>> > Saving to: `CHANGES?id=2012.02_rc3'
>>> >
>>> > 100%[======================================>] 55,525 ? ? ? 129K/s ? in 0.4s
>>> >
>>> > 2012-02-29 08:21:23 (129 KB/s) - `CHANGES?id=2012.02_rc3' saved [55525/55525]
>>>
>>> Hi Peter,
>>>
>>> Still a problem from two laptops, and from two locations. Work, i
>>> don't know who the isp is, but at home I am on ATT's uverse:
>>>
>> Not shown by that command, it is actually a cname chain:
>>
>> mszick at wolf466:~$ dig git.buildroot.net
>>
>> ; <<>> DiG 9.6-ESV-R4 <<>> git.buildroot.net
>> ;; global options: +cmd
>> ;; Got answer:
>> ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 44465
>> ;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 6, ADDITIONAL: 0
>>
>> ;; QUESTION SECTION:
>> ;git.buildroot.net. ? ? ? ? ? ? IN ? ? ?A
>>
>> ;; ANSWER SECTION:
>> git.buildroot.net. ? ? ?43200 ? IN ? ? ?CNAME ? buildroot.uclibc.org.
>> buildroot.uclibc.org. ? 86400 ? IN ? ? ?CNAME ? www.uclibc.org.
>> www.uclibc.org. ? ? ? ? 12667 ? IN ? ? ?A ? ? ? 140.211.167.224
>>
>> ;; AUTHORITY SECTION:
>> org. ? ? ? ? ? ? ? ? ? ?156427 ?IN ? ? ?NS ? ? ?b0.org.afilias-nst.org.
>> org. ? ? ? ? ? ? ? ? ? ?156427 ?IN ? ? ?NS ? ? ?d0.org.afilias-nst.org.
>> org. ? ? ? ? ? ? ? ? ? ?156427 ?IN ? ? ?NS ? ? ?b2.org.afilias-nst.org.
>> org. ? ? ? ? ? ? ? ? ? ?156427 ?IN ? ? ?NS ? ? ?a2.org.afilias-nst.info.
>> org. ? ? ? ? ? ? ? ? ? ?156427 ?IN ? ? ?NS ? ? ?a0.org.afilias-nst.info.
>> org. ? ? ? ? ? ? ? ? ? ?156427 ?IN ? ? ?NS ? ? ?c0.org.afilias-nst.info.
>>
>> ;; Query time: 314 msec
>> ;; SERVER: 169.254.0.4#53(169.254.0.4)
>> ;; WHEN: Wed Feb 29 10:00:57 2012
>> ;; MSG SIZE ?rcvd: 241
>>
>>
>>> me:~$ host -a git.buildroot.net
>>> Trying "git.buildroot.net"
>>> ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 65055
>>> ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
>>>
>>> ;; QUESTION SECTION:
>>> ;git.buildroot.net. ? ? ? ? ? IN ? ? ?ANY
>>>
>>> ;; ANSWER SECTION:
>>> git.buildroot.net. ? ?43200 ? IN ? ? ?CNAME ? buildroot.uclibc.org.
>>>
>>> Received 69 bytes from 192.168.0.1#53 in 126 ms
>>>
>>
>> So the problem might be your local bind operation, or uVerse's bind.
>> Try the same command with the specification of the server ( @server.domain.whatever )
>> for both your local bind and your isp's bind servers.
>>
>> Mike
>
> Hi Mike,
>
> I don't understand. How do I find a bind server? Is it the dns server?
> Anyway, here are my results from dig:
>
> me:~$ dig git.buildroot.net
>
> ; <<>> DiG 9.7.0-P1 <<>> git.buildroot.net
> ;; global options: +cmd
> ;; Got answer:
> ;; ->>HEADER<<- opcode: QUERY, status: SERVFAIL, id: 20746
> ;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 0
>
> ;; QUESTION SECTION:
> ;git.buildroot.net. ? ? ? ? ? ? IN ? ? ?A
>
> ;; Query time: 1305 msec
> ;; SERVER: 192.168.0.1#53(192.168.0.1)
> ;; WHEN: Wed Feb 29 08:12:17 2012
> ;; MSG SIZE ?rcvd: 35
>
> me:~$ dig 192.168.0.1
>
> ; <<>> DiG 9.7.0-P1 <<>> 192.168.0.1
> ;; global options: +cmd
> ;; Got answer:
> ;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 26222
> ;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 0
>
> ;; QUESTION SECTION:
> ;192.168.0.1. ? ? ? ? ? ? ? ? ? IN ? ? ?A
>
> ;; AUTHORITY SECTION:
> . ? ? ? ? ? ? ? ? ? ? ? 5477 ? ?IN ? ? ?SOA ? ? a.root-servers.net. nstld.verisign-grs.com. 2012022900
> 1800 900 604800 86400
>
> ;; Query time: 1056 msec
> ;; SERVER: 192.168.0.1#53(192.168.0.1)
> ;; WHEN: Wed Feb 29 08:16:27 2012
> ;; MSG SIZE ?rcvd: 104
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Hello All,

I have to agree with everyone above.  Something is wrong and its been
happening since Monday night.  I did a pull Monday afternoon just fine
and starting Monday evening I've been getting the following message
for the past couple of days!

[chris at milton buildroot]$ git pull
fatal: Unable to look up git.buildroot.net (port 9418) (Name or
service not known)
[chris at milton buildroot]$

nslookup gives me this:

[chris at milton .git]$ nslookup git.buildroot.net
;; Got SERVFAIL reply from 65.32.5.111, trying next server
Server:		65.32.5.111
Address:	65.32.5.111#53

** server can't find git.buildroot.net: NXDOMAIN
[chris at milton .git]$

I've been pulling for over a year now with no problems. i've tried it
at work and at home to no avail.  I'm on Brighthouse/Time Warner at
home and work has its own NAP to the internet so there appears to be a
problem somewhere out there in dns land...

I can ping and pull by ip address just fine.  Also, there have not
been any updates to my computer or its configuration that appear to be
impacting dns/bind or anything else I can see as far as my machine
goes.  Fedora 16 on x86_64.

Regards,
Chris
