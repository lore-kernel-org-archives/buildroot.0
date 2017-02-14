From: LogiSch17 <logi.tss@hotmail.de>
Date: Tue, 14 Feb 2017 02:06:59 -0800 (PST)
Subject: [Buildroot] Shell scripts does not emit finished() to QProcess
In-Reply-To: <ce6994a6-76f7-a075-51b6-e80dc306cdd8@gmail.com>
References: <1486997512738-156891.post@n4.nabble.com>
 <ce6994a6-76f7-a075-51b6-e80dc306cdd8@gmail.com>
Message-ID: <1487066819690-156977.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
in my code i have something like:

void UpdateHandler::UpdateHandler(QObject* parent):QObject(parent){

     copy  = new QProcess(this);
     updEnc = new QFile("/media/upStick/update.enc"); //encrypt update file
on stick
     cpscript <<"/usr/bin/cpupdt.sh"; //shell script to copy the file to
/usr

      QObject::connect(copy, SIGNAL(finished(int, QProcess::ExitStatus)),
this, SLOT(fileCopied(int, QProcess::ExitStatus)));
}

void UpdateHandler::copyFile(){

    if(updEnc->exists()){
        qDebug()<< "Updatefile found on Stick";
        qDebug()<< "copying file to /usr";

        copy->start("/bin/sh", cpscript);
    }
}
void UpdateHandler::fileCopied(int status, QProcess::ExitStatus estatus){

     QDebug()<< "File copied, Status: " << status << estatus ;
.....
}

Have not tried strace -f yet.
But i will test i now.





--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Shell-scripts-does-not-emit-finished-to-QProcess-tp156891p156977.html
Sent from the Buildroot (busybox) mailing list archive@Nabble.com.
