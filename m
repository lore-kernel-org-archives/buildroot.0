From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 29 Feb 2012 07:54:10 -0800
Subject: [Buildroot] Buildroot 2012.02-rc3 released
In-Reply-To: <877gz6drz9.fsf@macbook.be.48ers.dk>
References: <87ehtg2r6n.fsf@macbook.be.48ers.dk> <4F4D2A90.1050309@gmail.com>
 <877gz6drz9.fsf@macbook.be.48ers.dk>
Message-ID: <CAJJ6jxtawrULPdNUykruT4azk68_ZgFMRf6UwDJNH0D=AckBJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 28, 2012 at 11:22 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>> "Steve" == Steve Calfee <stevecalfee@gmail.com> writes:
>
> Hi,
>
> ?>> http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3
> ?>>
> ?Steve> There seems to be something wrong with the servers. I cannot access
> ?Steve> the url above.
>
> ?Steve> I am also having similar problems with git access:
>
> ?Steve> me:~/nobu/br/dockstar/tools$ git remote -v
> ?Steve> origin ? ?http://git.buildroot.net/buildroot (fetch)
> ?Steve> origin ? ?http://git.buildroot.net/buildroot (push)
>
> ?Steve> me:~/nobu/br/dockstar/tools$ git fetch
> ?Steve> error: Couldn't resolve host 'git.buildroot.net' while accessing
> ?Steve> http://git.buildroot.net/buildroot/info/refs
>
> ?Steve> fatal: HTTP request failed
>
> DNS problems at your side? The *.uclibc.org DNS has recently moved from
> Eriks own machine to the osuosl.org people.
>
> It works here:
>
> host -a git.buildroot.net
> Trying "git.buildroot.net"
> ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 33511
> ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0
>
> ;; QUESTION SECTION:
> ;git.buildroot.net. ? ? ? ? ? ? IN ? ? ?ANY
>
> ;; ANSWER SECTION:
> git.buildroot.net. ? ? ?5279 ? ?IN ? ? ?CNAME ? buildroot.uclibc.org.
>
> wget 'http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3'
> --2012-02-29 08:21:16-- ?http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3
> Resolving git.buildroot.net (git.buildroot.net)... 140.211.167.224
> Connecting to git.buildroot.net (git.buildroot.net)|140.211.167.224|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 55525 (54K) [text/plain]
> Saving to: `CHANGES?id=2012.02_rc3'
>
> 100%[======================================>] 55,525 ? ? ? 129K/s ? in 0.4s
>
> 2012-02-29 08:21:23 (129 KB/s) - `CHANGES?id=2012.02_rc3' saved [55525/55525]

Hi Peter,

Still a problem from two laptops, and from two locations. Work, i
don't know who the isp is, but at home I am on ATT's uverse:

me:~$ host -a git.buildroot.net
Trying "git.buildroot.net"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 65055
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;git.buildroot.net.		IN	ANY

;; ANSWER SECTION:
git.buildroot.net.	43200	IN	CNAME	buildroot.uclibc.org.

Received 69 bytes from 192.168.0.1#53 in 126 ms
me:~$ wget 'http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3'
--2012-02-29 07:47:04--
http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3
Resolving git.buildroot.net... failed: Name or service not known.
wget: unable to resolve host address `git.buildroot.net'

Regards, Steve
