From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Mar 2019 22:17:39 +0100
Subject: [Buildroot] [PATCH 1/1] go: explicitly disable modules to avoid
 unintended network lookup
In-Reply-To: <87lg1wg1wf.fsf@paral.in> (Christian Stewart's message of "Sat,
 02 Mar 2019 17:52:32 -0800")
References: <20190126102355.24766-1-christian@paral.in>
 <87va1pgyhe.fsf@paral.in> <20190212165759.euozased2t6zrmka@bifrost>
 <87sgwsh6k7.fsf@paral.in> <20190213091601.wnoefujowo6j5t7q@bifrost>
 <87lg1wg1wf.fsf@paral.in>
Message-ID: <87ef7nk68c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi All,
 > Anisse Astier <anisse@astier.eu> writes:
 >>> If you do this reproduction with ANY > go1.11 version of Buildroot
 >>> today:
 >>> 
 >>> export GO111MODULE=on
 >>> make docker-engine
 >>> 
 >>> Then Buildroot will leak the GO111MODULE variable into the build
 >>> process, and Go will start downloading dependencies from the internet
 >>> and ignore GOPATH. 
 >>> 
 >>> Here is a reproduction, where Go makes network calls:
 >>> 
 >>> https://asciinema.org/a/pKktUhsN2NDoWkiCEgW9iUPbA

 > This is still the case today. What are the statuses of these patches?

 >  - https://patchwork.ozlabs.org/patch/1031429/

I have just applied it now.

>  - https://patchwork.ozlabs.org/patch/1048076/

This is for next / post 2019.02. I haven't looked closely at it yet, but
will do so soon.

-- 
Bye, Peter Korsgaard
