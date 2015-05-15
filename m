From: John O'Sullivan <john.osullivan@cloudiumsystems.com>
Date: Fri, 15 May 2015 16:46:44 +0100
Subject: [Buildroot] Generating Debug Info Files
In-Reply-To: <20150515151218.2cb0d3e4@free-electrons.com>
References: <00b501d08d9b$87eae570$97c0b050$@osullivan@cloudiumsystems.com>	<20150514215914.10e83cad@free-electrons.com>	<5555D2F5.80308@cloudiumsystems.com>
 <20150515151218.2cb0d3e4@free-electrons.com>
Message-ID: <555614E4.6050408@cloudiumsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/05/15 14:12, Thomas Petazzoni wrote:
> Dear John OSullivan,
>
> On Fri, 15 May 2015 12:05:25 +0100, John OSullivan wrote:
>
>> Thanks for your reply, I already have debugging symbols on for the test
>> application running on my target but perf still complains:
>> Failed to open test_application, continuing without symbols
> Ok.
>
>> The file has symbols and is not stripped and gdb has no problem finding
>> the symbols so I think the issue is that perf is expecting to find the
>> symbols in some separate file, its difficult to get clarity on this but
>> I believe that in Ubuntu you would install a debug package, I believe
>> this installs separate files with symbol information in certain
>> locations like for example /usr/lib/.debug for libraries.
>> I was going to try and do something similar with my buildroot file
>> system to see if it resolved the perf problem.
> I am not sure that having the debugging symbols in a separate file
> makes a difference here. It's indeed the way desktop/server distros
> such as Ubuntu distribute the debugging symbols, but I 'm not sure it
> will make a difference for perf.
>
> Maybe perf needs some dependency such as libunwind to be able to use
> the debugging symbols?
Then I guess I would need to move from buildroot 2013-05 to 
buildroot-2015-02 before the perf stuff would work as this would give me 
libunwind. I can try that and see if it makes a difference.
>
> Thomas
