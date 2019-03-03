From: Christian Stewart <christian@paral.in>
Date: Sat, 02 Mar 2019 17:52:32 -0800
Subject: [Buildroot] [PATCH 1/1] go: explicitly disable modules to avoid
 unintended network lookup
In-Reply-To: <20190213091601.wnoefujowo6j5t7q@bifrost>
References: <20190126102355.24766-1-christian@paral.in>
 <87va1pgyhe.fsf@paral.in> <20190212165759.euozased2t6zrmka@bifrost>
 <87sgwsh6k7.fsf@paral.in> <20190213091601.wnoefujowo6j5t7q@bifrost>
Message-ID: <87lg1wg1wf.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Anisse Astier <anisse@astier.eu> writes:
>> If you do this reproduction with ANY > go1.11 version of Buildroot
>> today:
>> 
>> export GO111MODULE=on
>> make docker-engine
>> 
>> Then Buildroot will leak the GO111MODULE variable into the build
>> process, and Go will start downloading dependencies from the internet
>> and ignore GOPATH. 
>> 
>> Here is a reproduction, where Go makes network calls:
>> 
>> https://asciinema.org/a/pKktUhsN2NDoWkiCEgW9iUPbA

This is still the case today. What are the statuses of these patches?

 - https://patchwork.ozlabs.org/patch/1031429/
 - https://patchwork.ozlabs.org/patch/1048076/

Best regards,
Christian
